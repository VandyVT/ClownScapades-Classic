using System;
using UnityEngine;
using UnityEngine.AI;

// Token: 0x0200001C RID: 28
public class MusicTrigger : MonoBehaviour
{
	// Token: 0x06000072 RID: 114 RVA: 0x000035CC File Offset: 0x000017CC
	private void Start()
	{
		this.musicZone = base.GetComponent<CapsuleCollider>();
		this.enemyGame = GameObject.Find("EnemyOBJ").GetComponent<NavMeshAgent>();
	}

	// Token: 0x06000073 RID: 115 RVA: 0x000035F0 File Offset: 0x000017F0
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			base.GetComponent<AudioSource>().Play();
			this.GateTrigger.GetComponent<AudioSource>().Stop();
			GameObject.Find("EnemyFastStep").GetComponent<AudioSource>().Play();
			GameObject.Find("EnemyStep").GetComponent<AudioSource>().Stop();
			this.musicZone.radius += 4f;
			this.enemyGame.speed += 1f;
			GameObject.Find("EnemyOBJ").GetComponent<EnemyWander>().enabled = false;
			GameObject.Find("EnemyOBJ").GetComponent<EnemyAIScript>().enabled = true;
		}
	}

	// Token: 0x06000074 RID: 116 RVA: 0x000036A8 File Offset: 0x000018A8
	private void OnTriggerExit(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			base.GetComponent<AudioSource>().Stop();
			this.GateTrigger.GetComponent<AudioSource>().Play();
			GameObject.Find("EnemyFastStep").GetComponent<AudioSource>().Stop();
			GameObject.Find("EnemyStep").GetComponent<AudioSource>().Play();
			this.musicZone.radius += -4f;
			this.enemyGame.speed += -1f;
			this.MusicEnable.SetActive(false);
			GameObject.Find("EnemyOBJ").GetComponent<EnemyWander>().enabled = true;
			GameObject.Find("EnemyOBJ").GetComponent<EnemyAIScript>().enabled = false;
		}
	}

	// Token: 0x04000071 RID: 113
	public GameObject GateTrigger;

	// Token: 0x04000072 RID: 114
	public GameObject MusicEnable;

	// Token: 0x04000073 RID: 115
	private CapsuleCollider musicZone;

	// Token: 0x04000074 RID: 116
	private NavMeshAgent enemyGame;
}
