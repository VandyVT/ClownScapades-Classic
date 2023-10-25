using System;
using UnityEngine;

// Token: 0x02000019 RID: 25
public class EnemyAnim : MonoBehaviour
{
	// Token: 0x06000064 RID: 100 RVA: 0x00003326 File Offset: 0x00001526
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			this.Enemy.SetBool("PlayerClose", true);
		}
	}

	// Token: 0x06000065 RID: 101 RVA: 0x00003346 File Offset: 0x00001546
	private void OnTriggerExit(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			this.Enemy.SetBool("PlayerClose", false);
		}
	}

	// Token: 0x04000065 RID: 101
	[SerializeField]
	private Animator Enemy;
}
