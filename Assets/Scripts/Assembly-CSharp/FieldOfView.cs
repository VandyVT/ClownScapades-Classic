using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200001B RID: 27
public class FieldOfView : MonoBehaviour
{
	// Token: 0x0600006D RID: 109 RVA: 0x0000346A File Offset: 0x0000166A
	private void Start()
	{
		base.StartCoroutine("FindTargetsWithDelay", 0.2f);
	}

	// Token: 0x0600006E RID: 110 RVA: 0x00003482 File Offset: 0x00001682
	private IEnumerator FindTargetsWithDelay(float delay)
	{
		for (;;)
		{
			yield return new WaitForSeconds(delay);
			this.FindVisibleTargets();
		}
		yield break;
	}

	// Token: 0x0600006F RID: 111 RVA: 0x00003498 File Offset: 0x00001698
	private void FindVisibleTargets()
	{
		this.visibleTargets.Clear();
		Collider[] array = Physics.OverlapSphere(base.transform.position, this.viewRadius, this.targetMask);
		for (int i = 0; i < array.Length; i++)
		{
			Transform transform = array[i].transform;
			Vector3 normalized = (transform.position - base.transform.position).normalized;
			if (Vector3.Angle(base.transform.forward, normalized) < this.viewAngle / 2f)
			{
				float maxDistance = Vector3.Distance(base.transform.position, transform.position);
				if (!Physics.Raycast(base.transform.position, normalized, maxDistance, this.obstacleMask))
				{
					this.visibleTargets.Add(transform);
					this.MusicDisable.SetActive(true);
				}
			}
		}
	}

	// Token: 0x06000070 RID: 112 RVA: 0x0000357E File Offset: 0x0000177E
	public Vector3 DirFromAngle(float angleInDegrees, bool angleIsGlobal)
	{
		if (!angleIsGlobal)
		{
			angleInDegrees += base.transform.eulerAngles.y;
		}
		return new Vector3(Mathf.Sin(angleInDegrees * 0.017453292f), 0f, Mathf.Cos(angleInDegrees * 0.017453292f));
	}

	// Token: 0x0400006B RID: 107
	public GameObject MusicDisable;

	// Token: 0x0400006C RID: 108
	public float viewRadius;

	// Token: 0x0400006D RID: 109
	[Range(0f, 360f)]
	public float viewAngle;

	// Token: 0x0400006E RID: 110
	public LayerMask targetMask;

	// Token: 0x0400006F RID: 111
	public LayerMask obstacleMask;

	// Token: 0x04000070 RID: 112
	[HideInInspector]
	public List<Transform> visibleTargets = new List<Transform>();
}
