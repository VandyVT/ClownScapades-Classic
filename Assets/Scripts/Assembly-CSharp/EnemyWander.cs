using System;
using System.Collections;
using UnityEngine;
using UnityEngine.AI;

// Token: 0x0200001A RID: 26
public class EnemyWander : MonoBehaviour
{
	// Token: 0x06000067 RID: 103 RVA: 0x00003366 File Offset: 0x00001566
	private void Start()
	{
		this.agent = base.GetComponent<NavMeshAgent>();
		this._as = base.GetComponent<AudioSource>();
		this.agent.autoBraking = false;
		this.GotoNextPoint();
		base.Invoke("RandomVoiceLine", 8f);
	}

	// Token: 0x06000068 RID: 104 RVA: 0x000033A2 File Offset: 0x000015A2
	private void GotoNextPoint()
	{
		if (this.points.Length == 0)
		{
			return;
		}
		this.agent.destination = this.points[this.destPoint].position;
		this.destPoint = (this.destPoint + 1) % this.points.Length;
	}

	// Token: 0x06000069 RID: 105 RVA: 0x000033E2 File Offset: 0x000015E2
	private void Update()
	{
		if (!this.agent.pathPending && this.agent.remainingDistance < 0.5f)
		{
			this.GotoNextPoint();
		}
	}

	// Token: 0x0600006A RID: 106 RVA: 0x0000340C File Offset: 0x0000160C
	private void RandomVoiceLine()
	{
		this._as.clip = this.audioClipArray[UnityEngine.Random.Range(0, this.audioClipArray.Length)];
		this._as.PlayOneShot(this._as.clip);
		base.StartCoroutine("VoiceTimer");
	}

	// Token: 0x0600006B RID: 107 RVA: 0x0000345B File Offset: 0x0000165B
	private IEnumerator VoiceTimer()
	{
		yield return new WaitForSeconds(45f);
		this.RandomVoiceLine();
		yield break;
	}

	// Token: 0x04000066 RID: 102
	public AudioSource _as;

	// Token: 0x04000067 RID: 103
	public AudioClip[] audioClipArray;

	// Token: 0x04000068 RID: 104
	public Transform[] points;

	// Token: 0x04000069 RID: 105
	private int destPoint;

	// Token: 0x0400006A RID: 106
	private NavMeshAgent agent;
}
